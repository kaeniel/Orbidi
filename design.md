
## Explicación del Diseño de Infraestructura para Orbidi

1. **ECS Cluster**:
   - En lugar de usar instancias EC2 con Docker, el cluster ECS administra el ciclo de vida de los contenedores.
   - Permite un escalado automático de tareas (contenedores) basándose en métricas como el uso de CPU o memoria.
   - ECS simplifica la gestión de contenedores y reduce la carga de administración manual.
   - El cluster ECS puede estar configurado para operar en múltiples zonas de disponibilidad (AZ) dentro de una región de AWS. Esto asegura que si una AZ falla, las tareas en la otra AZ continúen funcionando, mejorando la resiliencia de la aplicación.

2. **ECS Task**:
   - Cada aplicación FastAPI está contenida en una ECS Task, configurada con los recursos necesarios para su ejecución.
   - Facilita la separación de aplicaciones en contenedores individuales, permitiendo escalar cada una según la demanda.

3. **Load Balancer (LB)**:
   - El Application Load Balancer (ALB) dirige el tráfico HTTP/HTTPS hacia las tareas en el ECS Cluster, distribuyendo la carga y mejorando la disponibilidad.
   - Configurado para redirigir el tráfico a los contenedores en función de las reglas definidas.
   - El ALB también puede estar configurado en múltiples AZ, garantizando que el tráfico sea dirigido a las tareas disponibles incluso en caso de que una instancia del ALB falle.

4. **S3 y DynamoDB**:
   - **S3**: Usado para almacenar el estado remoto de Terraform, manteniendo el estado de infraestructura centralizado y accesible para despliegues futuros.
   - **DynamoDB**: Configurado como mecanismo de bloqueo para el estado de Terraform, lo que previene conflictos de concurrencia en despliegues multiusuario.

## Decisiones de Diseño

- **Amazon ECS sobre EC2**: Optamos por ECS debido a la mejor gestión de contenedores, soporte de escalabilidad automática, y menor carga administrativa en comparación con EC2 con Docker.
- **Load Balancer**: Mejora la resiliencia y escalabilidad de la aplicación, asegurando que el tráfico se distribuya eficientemente.
- **Separación de Componentes**: Cada componente (cómputo, almacenamiento, balanceo de carga) está desacoplado, permitiendo flexibilidad en el escalado y actualizaciones.

# Diseño de Infraestructura

```mermaid
graph TD
  subgraph VPC
    A[Public Subnet] -->|HTTP| LB[Load Balancer]
    LB -->|TCP| ECS[Amazon ECS Cluster]
    ECS --> Task1[ECS Task: FastAPI App 1]
    ECS --> Task2[ECS Task: FastAPI App 2]
    A -->|HTTPS| S3[S3 Bucket for Static Files]
  end
  DDB[(DynamoDB)] -.->|State Lock| Terraform[Terraform Backend]
