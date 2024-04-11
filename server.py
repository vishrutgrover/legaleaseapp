from llama_index.core import VectorStoreIndex, Settings, StorageContext
from llama_index.llms.openai import OpenAI
from llama_index.llms.Hugging
from llama_index.embeddings.openai import OpenAIEmbedding
import chromadb
from llama_index.vector_stores.chroma import ChromaVectorStore
import os
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
from pydantic import BaseModel
from typing import Union
from file_creation import *


load_dotenv()
app = FastAPI()
query_agent = None

class ChatResponse(BaseModel):
    response : str
    code : int

class ErrorResponse(BaseModel):
    message : str
    code : int

class Query(BaseModel):
    query : str
    filename : str

@app.get('/')
async def buffer():
    return {"message" : "Server is running", "code" : 200}

@app.post('/chat', response_model=Union[ChatResponse, ErrorResponse])
async def chat_query(user : Query):
    print(user.query)
    try:
        response = query_agent.query(user.query)
        response = str( response)
        print(response)
        await generate_pdf(response, user.filename)
        # return FileResponse(path = "./sample.pdf", media_type='application/pdf', filename = "sample.pdf")
        return ChatResponse(response="File Generated", code=200)
    except HTTPException as e:
        return ErrorResponse(message=str(e.detail), code=e.status_code)

@app.get('/downloadFile', response_model=Union[FileResponse, ErrorResponse])
async def downloadFile():
    print("File Download Request Received")
    try: 
        return FileResponse(path="./sample.pdf", media_type='application/pdf', filename='sample.pdf', status_code=200)
    except HTTPException as e : 
        return ErrorResponse(message=str(e.detail), code = 500)

@app.on_event('startup')
def server():
    global query_agent
    os.environ['OPENAI_API_KEY'] = os.getenv('OPENAI_API_KEY')
    client = chromadb.PersistentClient(
        path="./chromadb"
    )

    Settings.llm = OpenAI(api_key=os.environ['OPENAI_API_KEY'], model="gpt-3.5-turbo-0125")
    Settings.embed_model = OpenAIEmbedding(api_key=os.environ['OPENAI_API_KEY'], model='text-embedding-3-large')

    chroma_collection = client.get_collection('legal_ease')
    vector_store = ChromaVectorStore(chroma_collection=chroma_collection)
    index = VectorStoreIndex.from_vector_store(
        vector_store=vector_store
    )

    query_agent = index.as_query_engine()
    print("STARTUP SUCCESSFUL")


if __name__ == "__main__":
    app.run()


# uvicorn server:app --host 0.0.0.0 --port 3000 - TYPE THIS IN THE TERMINAL TO RUN THE SERVER.

