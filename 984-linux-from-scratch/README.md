# Preparación para Linux From Scratch

Esta carpeta documenta el plan de compilación. **La compilación de LFS no se
puede completar ni certificar desde este paquete**: requiere una máquina Linux
compatible, recursos de disco y horas de compilación. Sigue la edición estable
vigente de la guía oficial y registra las versiones y comandos utilizados.

## Pasos de alto nivel

1. Elige la guía estable en [linuxfromscratch.org](https://www.linuxfromscratch.org/lfs/).
2. Prepara una instalación Linux anfitriona que cumpla la sección de requisitos.
3. Crea una partición dedicada y el usuario `lfs`; conserva copia de seguridad.
4. Descarga las fuentes exactas del libro y verifica sumas de comprobación.
5. Construye la toolchain temporal en `$LFS/tools` siguiendo el orden de capítulos.
6. Entra al entorno chroot y compila los paquetes base, configuración y kernel.
7. Instala el cargador de arranque, reinicia en el sistema nuevo y captura evidencias.

## Bitácora de entrega

Completa esta tabla durante la compilación:

| Dato | Valor |
|---|---|
| Edición/enlace exacto de LFS | Pendiente |
| Distribución anfitriona | Pendiente |
| CPU / RAM / espacio libre | Pendiente |
| Fecha de inicio y fin | Pendiente |
| Resultado del arranque | Pendiente |
| Evidencia (capturas/logs) | Pendiente |

No ejecutes comandos de particionado o formateo hasta confirmar con cuidado el
dispositivo destino: pueden borrar datos. La guía oficial es la autoridad para
versiones y comandos; no copies instrucciones de una edición distinta.
