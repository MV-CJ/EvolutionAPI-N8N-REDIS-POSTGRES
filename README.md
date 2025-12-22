# Projeto N8N + EvolutionApi - Script integrado 🤓💻

### 🧑‍🏭 Como rodar o script `build_evolution.sh`

Nesse repositorio temos os arquivos principais para buildar os containers: ```'redis', 'postgres', 'n8n', 'evolution-api'``` .

___Obs: A Evolution-Api desta aplicação utiliza a versão base do github para uma melhor estabilidade e merge das versões. Você poderá altera-las utilizando o versionamento do proprio git antes de rodar o ```.build_evolution.sh```___

### 👣 Steps para iniciar o ambiente de desenvolvimento
1. **Preparar o ambiente (.env)**

Para facilitar, disponibilizei o fastenv, nele existe variaveis prontas configuradas para ambiente __LOCAL__ para teste e desenvolvimento. 

<span style="color:red"><strong>Não recomendamos essa env para ambiente de PRODUÇÃO</strong></span>


```bash
mv usar_fastenv.txt .env
```

2. **Dar permissão de execução ao script**:

```bash
chmod +x ./build_evolution.sh
./build_evolution.sh
```
_______

<div style="
  border: 2px solid #22c55e;
  background-color: #ecfdf5;
  color: #065f46;
  padding: 16px 20px;
  border-radius: 8px;
  font-family: Arial, Helvetica, sans-serif;
  max-width: 720px;
">
  <h3 style="margin: 0 0 8px 0;">✅ Tudo pronto!</h3>
  <p style="margin: 0; font-size: 15px;">
    E voilà!!<br>
    Seu ambiente está pronto para desenvolver a sua automação 🚀
  </p>
</div>
