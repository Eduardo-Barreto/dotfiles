import pyperclip
from PIL import ImageGrab
from shutil import copy


img = ImageGrab.grabclipboard()

if img is None:
    print("Clipboard is empty or is not an image")
    exit()

if isinstance(img, list):
    print("Gif detected")
    copy(img[0], "/home/eduardo-barreto/clipboard/clipboard.gif")
    print("Gif saved at ~/clipboard/clipboard.gif")
    pyperclip.copy("~/clipboard/")
else:
    print("Image detected")
    try:
        img.save("/home/eduardo-barreto/clipboard/clipboard.jpg")
        print("Image saved at ~/clipboard/clipboard.jpg")
        pyperclip.copy("~/clipboard/")
    except OSError:
        img.save("/home/eduardo-barreto/clipboard/clipboard.png")
        print("Image saved at ~/clipboard/clipboard.png")
        pyperclip.copy("~/clipboard/")
