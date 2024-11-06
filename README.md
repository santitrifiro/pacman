# PROYECTO PAC-MAN LC3

Integrantes: Violeta Magliaro, Valentino Mustafá, Santiago Simón Trifiró, Valentina Rivero

Labores:

(Por comodidad solo un integrante generó commits).

Violeta Magliaro: Ideamiento de trayecto de fantasmas, patrón diseñado por coordenadas.
Valentino Mustafá: Investigación de cómo manipular display gráfico, gestión de coordenadas y creación de colores.
Valentina Rivero: Ideamiento de comportamiento general del juego, qué elementos tendrá y cómo asignarlos al mapa general.
Santiago Simón Trifiró: Código en LC3, ideamiento e implementación de planes y medidas.

Este proyecto consiste en una implementación del videojuego clásico **PAC-MAN** en el simulador LC3. La idea es recrear la experiencia del juego original, utilizando la lógica y los principios del simulador para ofrecer un desafío entretenido y educativo.

## Pacman

**Pac-Man** es un icónico videojuego de arcade lanzado por Namco en 1980, que rápidamente se convirtió en un fenómeno cultural. En este juego, el jugador controla a Pac-Man, una criatura amarilla que debe comer todos los puntos en un laberinto mientras evita ser atrapado por cuatro fantasmas.

### Cómo se juega

El objetivo principal de Pac-Man es acumular la mayor cantidad de puntos posible al comer todos los puntos del laberinto. Los jugadores utilizan las teclas de dirección para mover a Pac-Man, tratando de evitar los fantasmas que lo persiguen. Aquí están las reglas básicas:

- **Puntos**: Cada punto que Pac-Man come suma puntos a su puntuación total. 
- **Fantasmas**: Los fantasmas tienen patrones de movimiento específicos que el jugador debe aprender para evitar ser atrapado. Cada vez que Pac-Man es tocado por un fantasma, pierde una vida.

El juego termina cuando Pac-Man pierde todas sus vidas, pero se puede reiniciar en cualquier momento.

## Creación

La idea principal de este proyecto es dividir el display del simulador LC3 en una grilla de 16 x 15. Cada casilla de la grilla se asigna en memoria con un valor único que representa diferentes elementos del juego. Esto incluye:

- **Paredes**: Se asigna un valor específico a las casillas que contienen paredes, evitando que Pac-Man las atraviese y creando el laberinto.
- **Puntos**: Se asigna un valor a los puntos que Pac-Man debe comer. Estos son los elementos clave para acumular puntos, ya que al consumir todos se gana la partida.
- **Monstruos**: Los fantasmas tienen valores únicos que controlan su aparición y movimiento. La inteligencia artificial detrás de los fantasmas se ha implementado para ofrecer un desafío realista al jugador.

El desarrollo de este juego se basa en los principios de programación en ensamblador del LC3, lo que brinda una excelente oportunidad para aprender sobre la manipulación de memoria y los gráficos en un entorno limitado.

## Cómo compilar

Para compilar y ejecutar el juego, debe seguir los siguientes pasos:

1. **Entrar a la carpeta `/program`**: Asegúrese de estar en la carpeta correcta donde se encuentran los archivos del programa.
2. **Abrir el simulador**: Utilice el siguiente comando para abrir el simulador LC3:
   ```bash
   java -jar LC3sim.jar
Cargar el sistema operativo y el programa: En el simulador, ingrese las siguientes líneas:

  ```bash
  /load lc3os.obj
  /load program.obj
  ```

3. **Continuar**: Presione el botón "continue" en el simulador para avanzar en la carga del programa.

4. **Modificar el PSR**: Cambie el registro PSR (Processor Status Register) a `x8002` para otorgar permisos de display.

Jugar: Una vez configurado todo, ¡está listo para jugar! Use las teclas de dirección para controlar a Pac-Man y disfrutar del juego.

## Contacto

Si tienes alguna pregunta o comentario, no dudes en contactarme a través de [santuchotrifiro@hotmail.com].
