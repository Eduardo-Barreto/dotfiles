from PIL import ImageGrab
import pyperclip
from google.generativeai import configure, GenerativeModel
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Get the API key from the environment variable
api_key = os.getenv("GEMINI_API_KEY")

if not api_key:
    print("Error: GEMINI_API_KEY not found in the .env file.")
    exit()

# Configure Gemini API key
configure(api_key=api_key)

pyperclip.set_clipboard("xclip")

def extract_text_from_image_with_gemini(image):
    """
    Extracts text from an image using Google Gemini 2.0-flash and returns only the text.

    Args:
        image: PIL Image object.

    Returns:
        str: Extracted text, or None if an error occurs.
    """
    try:
        model = GenerativeModel('gemini-2.0-flash')
        prompt = "Extract the text from the image. Do not include any bounding box information or labels. Just give me the plain text."
        response = model.generate_content([prompt, image])
        return response.text
    except Exception as e:
        print(f"Error during Gemini OCR: {e}")
        return None

def main():
    """
    Grabs an image from the clipboard, extracts text using Gemini 2.0-flash,
    prints the extracted text, and copies it to the clipboard.
    """
    # Grab image from clipboard
    image = ImageGrab.grabclipboard()

    # Check if image exists
    if image is not None:
        # Extract text from the image using Gemini
        extracted_text = extract_text_from_image_with_gemini(image)

        if extracted_text:
            # Print the extracted text
            print("Extracted Text:")
            print(extracted_text)
            pyperclip.copy(extracted_text)
            print("Copied to clipboard.")
        else:
            print("Failed to extract text using Gemini.")
    else:
        print("No image found in clipboard.")

if __name__ == "__main__":
    main()
