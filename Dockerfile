FROM nfcore/base:1.9
LABEL authors="carlos.ruiza@upf.edu" \
      description="Docker image containing all requirements for calling CNVs with TCAG pipeline (https://github.com/bjtrost/TCAG-WGS-CNV-workflow)"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/cnvcalling-1.0.0/bin:$PATH

## TCAG pipeline
RUN cd ~ && git clone https://github.com/bjtrost/TCAG-WGS-CNV-workflow.git 

