## Instruções para configuração do laboratório (simples)

### Baixe as ferramentas:
  - Baixe o *Docker* - https://docs.docker.com/get-started/get-docker/
  - Baixe o *BeeKeeper* - https://www.pgadmin.org/

### Inicialize os bancos de dados

  - Execute:
      ```
      docker compose up
      ```

### Conecte-se ao banco de dados

  - **Opcionalmente**, conecte-se via UI:
    - Abra sua aplicação favorita e conecte-se utilizando as informações a seguir:
      - host: `localhost`
      - user: `postgres`
      - pass: `1234`
    - Para o banco menor, utilize:
      - port: `5431`
    - Para o banco maior, utilize:
      - port: `5433`
