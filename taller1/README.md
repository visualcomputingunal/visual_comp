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
2. Se implmentaron 6 mascaras de convolución incluyendo la identidad, entre las cuales están:
   
   * Gaussian Blur (1)
   * Box Blur (2)
   * Edge Detection 1 (3)
   * Edge Detection 2 (4)
   * Edge Detection 3 (5)
   * Identity (Any other key)

   En las primeras dos máscaras obtenemos una imagen difuminada que a simple vista no se nota la diferencia pero tecnicamente cada una de ellas proporciona una forma distinta de modificar la imagen original.

   Respecto a las máscaras que realizan detección de bordes, si se percibe un cambio cuando se prueba cada una de estas. La segunda mascara de este tipo (Edge Detection 2) es la que mejor resultado arroja ya que muestra con mayor detalle los borde si se compara con las otras dos máscaras.

   Se implementó la mascara de identidad para poder regresar a la imagen original.

   El unico problema que se tuvo al momento de implementar estas máscaras es que los valores de las matrices al estar en formato de fracción hacian que la imagen se viera negra, por lo tanto, se procedio a cambiar los valores por su equivalente en decimal para que mostrara cada uno de los efectos.

   Para poder ver cada una de las versiones de la imagen cuando se les aplica la convolución, basta con presionar la tecla que se muestra en parentesis en el listado mencionado previamente.
   
## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesión de tal
