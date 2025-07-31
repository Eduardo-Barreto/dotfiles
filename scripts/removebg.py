from rembg import remove
from PIL import Image, ImageGrab
import subprocess
import sys
import os
import io

def remove_background(image_path):
    # Abrir a imagem
    input_image = Image.open(image_path)

    # Remover o fundo da imagem
    output_image = remove(input_image)

    # Salvar a imagem com fundo removido
    output_path = os.path.splitext(image_path)[0] + '_no_background.png'
    output_image.save(output_path, format="PNG")

    print(f"Imagem com fundo removido salva em {output_path}")

def main():
    # Verificar se um caminho de imagem foi passado como argumento
    if len(sys.argv) > 1:
        image_path = sys.argv[1]
        if os.path.isfile(image_path):
            remove_background(image_path)
        else:
            print(f"O arquivo {image_path} não foi encontrado.")
            sys.exit(1)
    else:
        # Capturar a imagem da área de transferência
        input_image = ImageGrab.grabclipboard()

        if input_image is None:
            print("Não foi possível obter uma imagem da área de transferência.")
            sys.exit(1)

        print("Imagem detectada")

        # Remover o fundo da imagem
        output_image = remove(input_image)

        print("Imagem processada")

        # Criar um buffer para armazenar a imagem
        buffer = io.BytesIO()

        # Salvar a imagem no buffer
        output_image.save(buffer, format="PNG")

        # Copiar a imagem para a área de transferência
        output = subprocess.Popen(
            ("xclip", "-selection", "clipboard", "-t", "image/png", "-i"), stdin=subprocess.PIPE
        )
        output.stdin.write(buffer.getvalue())
        output.stdin.close()

        print("Imagem com fundo removido copiada para a área de transferência.")

if __name__ == "__main__":
    main()
