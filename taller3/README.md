# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo.
2. Sombrear su superficie a partir de los colores de sus vértices.
3. (opcional para grupos menores de dos) Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/nakednous/nub/releases).

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
| Jhon Sedano| jhonsd1996  |
| David Rico | davidrh195  |

## Discusión

Describa los resultados obtenidos. En el caso de anti-aliasing describir las técnicas exploradas, citando las referencias.

A medida que se aumenta la cantidad de cuadros en la malla, las aristas del triangulo se ven mejor definidas, esto es porque cada cuadro de la malla representa un pixel y al aumentar el numero de pixeles la imagen se ve mejor.

Se puede elegir entre pintar cuadros o puntos. Se obtiene un mejor resultado cuando se pintan cuadros ya que el area de cada pixel mostrado en la malla queda completamente coloreada.

Otra interacción que se puede utilizar es de cambiar la posicion de cualquier vector generando otro triangulo distinto.


## Entrega

* Plazo: 5/6/19 a las 24h.
