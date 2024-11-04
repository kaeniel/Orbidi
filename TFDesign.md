## Uso de Módulos de Terraform
Para estructurar el despliegue de la infraestructura de manera eficiente, utilizaremos varios módulos de Terraform. Estos módulos nos permiten reutilizar código y organizar mejor la infraestructura. Aquí están los módulos recomendados:

1. **Módulo de VPC**

**Uso:** Crea la VPC, subredes públicas y privadas, y grupos de seguridad.
**Por qué:** Centraliza la configuración de red, permitiendo modificar la infraestructura de red de manera independiente de otros recursos.

2. **Módulo de ECS**

**Uso:** Define el cluster de ECS, la configuración de tareas y servicios.
**Por qué:** Permite la creación y gestión de recursos de ECS de manera modular, facilitando el escalado y la actualización de aplicaciones.

3. **Módulo de Load Balancer**

**Uso:** Configura el Application Load Balancer (ALB) y sus reglas.
**Por qué:** Aisla la lógica de configuración del balanceador de carga, permitiendo ajustes específicos sin afectar otros componentes.

4. **Módulo de S3**

**Uso:** Configura el bucket S3 para almacenar el estado de Terraform y archivos estáticos.
**Por qué:** Facilita la gestión del almacenamiento y la seguridad de los archivos.

5. **Módulo de DynamoDB**

**Uso:** Configura la tabla de DynamoDB para el bloqueo del estado de Terraform.
**Por qué:** Permite manejar el estado de la infraestructura en un solo lugar, evitando conflictos de acceso.

# Terraform Estructura

```mermaid
graph TD
  A[Terraform Root Module] -->|Uses| B[VPC Module]
  A -->|Uses| C[ECS Module]
  A -->|Uses| D[Load Balancer Module]
  A -->|Uses| E[S3 Module]
  A -->|Uses| F[DynamoDB Module]
