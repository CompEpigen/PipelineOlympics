# Pipeline Olympics: continuous benchmarking of computational workflows for DNA methylation sequencing data

Analysis of bisulfite sequencing data relies upon processing that generally includes four core steps: read preprocessing, alignment, post-alignment processing and calling of methylation states. An impressive number of tools for each of the steps or their combinations, workflows integrating them as well as turn-key solutions have been proposed. Despite of this versatility, so far only few attempts have been made to systematically evaluate complete processing workflows in a standardized and unbiased analysis. Previous benchmarks either focused upon a single processing task, e.g. predominantly alignment software. None of the previous benchmarks covered the complete data processing workflow and was based on a reasonable gold-standard data set.

To bridge this gap, we set out to perform a thorough benchmarking study of bisulfite sequencing workflows. At the core of our benchmark is a set of samples with highly accurate methylation calls [Bock, Halbritter et al. 2016](https://doi.org/10.1038/nbt.3605), which we use as the gold-standard. We evaluate the software in the context of five most widely used sequencing protocols (two variants of standard whole genome bisulfite sequencing, tagmentation-based WGBS, PBAT and EMSeq)  and propose protocol-specific choice of workflows. To simplify the choice of workflows and enable continuity we developed rich data presentation and benchmarking resources (see below). To our knowledge, this is the most comprehensive benchmarking study of  processing workflows for DNA methylation sequencing data to date.

## Benchmarked workflows

Current study included 10 previously published workflows.

1. [BAT](http://www.bioinf.uni-leipzig.de/Software/BAT/)
2. [Biscuit](https://huishenlab.github.io/biscuit/)
3. [Bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/)
4. [BSBolt](https://github.com/NuttyLogic/BSBolt)
5. [bwa-meth](https://github.com/brentp/bwa-meth) with [MethylDackel](https://github.com/dpryan79/MethylDackel)
6. [FAME](https://github.com/FischerJo/FAME)
7. [gemBS](https://github.com/heathsc/gemBS)
8. [GSNAP](http://research-pub.gene.com/gmap/) with [BisSNP](https://people.csail.mit.edu/dnaase/bissnp2011/)
9. [methylCtools](https://github.com/hovestadt/methylCtools)
10. [methylpy](https://github.com/yupenghe/methylpy)

The benchmarking implementation and resources enable semless extension of the list of current workflows to include new software. 

## Pipeline Olympics resources

- Automated benchmarking portal based on [workflUX](https://github.com/workflux/workflux/)

https://epigenomics.dkfz.de/PipelineOlympics/workflux

- Interactive web-interface with benchmarking metrics

https://epigenomics.dkfz.de/PipelineOlympics/shiny



