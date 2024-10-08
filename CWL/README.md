# CWL implemetation of PipelineOlympics workflows

[Common Workflow Language (CWL)](https://www.commonwl.org/) is an open standard for describing how to  run each computing job and connect them to create workflows. Because CWL is a specification and not a specific piece of software, tools and workflows described using CWL are portable across various platforms that support the CWL standard.

All CWLs tool documents needed to run the worlflows are listed in [Workflows.md](https://github.com/CompEpigen/PipelineOlympics/blob/main/CWL/Workflows.md).

## Installation

The [cwltool](https://github.com/common-workflow-language/cwltool) and Docker are requried.

To retrieve the CWL-implemetation, clone this repository:
```
git clone https://github.com/ifishlin/Benchmarking_CWL
```

## Usage

CWL workflows have evolved to separate the workflow description and the data flow. 
  - Workflow file (.cwl) : Describing the workflow. 
  - Parameter file (.yml) : Provide the data flow to the workflow.

The simple way to execute a CWL workflow.
```
cwltool workflow.cwl workflow.yml
```


### 0) Build reference index

There is one CWL script for building index required by each workflow.
```
/workflows/tools/<workflow_name>_index.cwl 
```

Fill in the location of the reference fasta in the YAML file. 
```
# The YAML file (<workflow_name>_index.yml)
ref: 
    class: File
    path: ../genome/chr22.fa # replace with your reference.
```

Then, run it to create the index first. 
```
cd workflows/<workflow_name>/tools

cwltool <workflow_name>_index.cwl <workflow_name>_index.yml
```

### 1) Data preprocessing
Three specific CWLs for protocols, Swift, PBAT, and T-WGBS, were provided. Those protocols induce a different level of synthetic DNA, which must be removed before quality and adapter trimming.

- The Swift read sets are removed from the 15'bp at the end of read1 and 15'bp at the beginning of the read2.
- The PBAT read sets are removed the 6'bp at both ends of read1 and read2.
- The T-WGBS read sets are removed from the 9'bp at the end of the read2.

The CWLs for data preprocessing is in the directory. The Trim_galore and Trimmomatic versions are provided:
```
workflows/tools/trimming
```


### 2) Run the workflows

Each workflow has two versions, one for single library and the other for multiple library headsets. The difference is how to deal with redundancy removal. The multiple library version executes the redundancy removal within datasets of each library, then merges the BAMs of all libraries. On the contrary, the single library version runs in reverse order.

You can find two CWLs under the directory of each workflow: 
```
<workflow_name>.singlelib.cwl 

<workflow_name>.mulitlib.cwl
```

ALL workflows utilize docker and you can execute them without any software installation.

```
cwltool <workflow>.singlelib.cwl <workflow>.singlelib.yml
```
