import fpdf
async def generate_pdf(text : str, filename : str):
    pdf = fpdf.FPDF()
    pdf.add_page()
    pdf.set_font("Courier", size=12)
    lines = text.split('\n')
    for line in lines:
        pdf.multi_cell(0, 5, line, align='L')
    pdf.output(f"{filename}.pdf")
    print("PDF file generated successfully!")
