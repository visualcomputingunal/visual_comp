# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises.
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Complete la tabla:

| Integrante  |  github nick |
|-------------|--------------|
| David Rico  |  davidrh195  |
| Jhon Sedano |  jhonsd1996  |

## Discusión

1. Se realizó la transformación de la imagen original a escala de grises promediando el valor RGB de cada pixel.
2. Se implementaron 6 mascaras de convolución incluyendo la identidad, entre las cuales están:
   
   * Gaussian Blur
   * Box Blur
   * Edge Detection 1
   * Edge Detection 2
   * Edge Detection 3
   * Identity

   En las primeras dos máscaras obtenemos una imagen difuminada que a simple vista no se nota la diferencia pero tecnicamente cada una de ellas proporciona una forma distinta de modificar la imagen original.

   Respecto a las máscaras que realizan detección de bordes, si se percibe un cambio cuando se prueba cada una de estas. La segunda mascara de este tipo (Edge Detection 2) es la que mejor resultado arroja ya que muestra con mayor detalle los borde si se compara con las otras dos máscaras.

   Se implementó la máscara de identidad para poder regresar a la imagen original.

   El unico problema que se tuvo al momento de implementar estas máscaras es que los valores de las matrices al estar en formato de fracción hacian que la imagen se viera negra, por lo tanto, se procedio a cambiar los valores por su equivalente en decimal para que mostrara cada uno de los efectos.

   Para poder ver cada una de las versiones de la imagen cuando se les aplica la convolución, utilizamos un boton para cada mascara.

3. Se desplegaron dos histogramas, uno con la imagen original (el de color rojo) y otro con la imagen en escala de grises(de color oscuro), esta ultima para hacer la segmentacion. Se utilizó el metodo `brightness()` para conseguir el valor de color de cada pixel y poder formar asi el histograma.

4. Se utilizó el histograma de la imagen original a escala de grises para hacer la segmentación, esto porque, es mas sencillo tomar el valor del brightness en una imagen a escala de grises, y ademas en dicho histograma puden verse mejor los picos del histograma.
   
## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesión de tal
