FROM --platform=linux/amd64 python:3.6.15-slim-bullseye

RUN apt-get update && apt-get install -y make build-essential
RUN pip install jsonnet --no-build-isolation  
RUN pip install --upgrade pip
RUN pip install allennlp

COPY . /workspace
WORKDIR /workspace
VOLUME [ "/workspace" ]

RUN pip install -r requirements.txt

# optional: jupyter server
RUN pip install jupyter jupyterlab jupyter_contrib_nbextensions
ENV JUPYTER_ENABLE_LAB=yes
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_origin='*'", "--NotebookApp.disable_check_xsrf=True"]
EXPOSE 8888
