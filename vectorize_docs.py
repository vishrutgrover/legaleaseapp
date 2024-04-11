import os 
from dotenv import load_dotenv
import time

load_dotenv()
os.environ['OPENAI_API_KEY'] = os.getenv('OPENAI_API_KEY')

from llama_index.core import SimpleDirectoryReader, VectorStoreIndex, Settings, StorageContext
from llama_index.llms.openai import OpenAI
from llama_index.embeddings.openai import OpenAIEmbedding
import chromadb
from llama_index.vector_stores.chroma import ChromaVectorStore

client = chromadb.PersistentClient(
    "./chromadb"
)

chroma_collection = client.get_or_create_collection("legal_ease")
vector_store = ChromaVectorStore(chroma_collection=chroma_collection)
storage_context = StorageContext.from_defaults(vector_store=vector_store)
Settings.embed_model = OpenAIEmbedding(
    api_key=os.environ['OPENAI_API_KEY'], 
    model="text-embedding-3-large"
    )

documents = SimpleDirectoryReader("./Lawyered_Files").load_data()
print("Documents Loaded")
time.sleep(2)
index = VectorStoreIndex.from_documents(documents=documents, storage_context=storage_context)
print("Indexing Done")
time.sleep(2)
print("DONE")
