from PIL import ImageGrab
import pytesseract
import pyperclip

pyperclip.set_clipboard("xclip")


def extract_text_from_image(image):
    # Perform OCR using pytesseract
    extracted_text = pytesseract.image_to_string(image)
    return extracted_text


def main():
    # Grab image from clipboard
    image = ImageGrab.grabclipboard()

    # Check if image exists
    if image is not None:
        # Extract text from the image
        extracted_text = extract_text_from_image(image)

        # Print the extracted text
        print("Extracted Text:")
        print(extracted_text)
        pyperclip.copy(extracted_text)
    else:
        print("No image found in clipboard.")


if __name__ == "__main__":
    main()
