# Parameter sheets for the PipelineOlympics workflUX server

Ready-made workflUX parameter sheets for the workflows on the PipelineOlympics
demo server. Each sheet configures one job for one workflow and one protocol,
with four runs, one per test sample: `5N`, `5T`, `6N` and `6T`. The settings
are those of the job YAML files next to the workflows in `CWL/workflows` of this repository,
and the input paths point to the test data on the server (`/data/data`).

## How to use a sheet

1. Download the sheet for your workflow and protocol (table below).
2. In workflUX, open **Create Job** and select the workflow named in the sheet's
   file name (the part before the protocol).
3. Enter a **Job name** (no spaces), then under **Provide parameter using** choose
   **Spreadsheet**.
4. Skip the export step: under **3. Import and create job**, select the
   downloaded sheet and import it.
5. Open **Job Execution & Results**, select the job and start its four runs.

To change settings, open the sheet in Excel or LibreOffice:

| Tab | Contents |
|---|---|
| `global single values` | settings shared by all four runs (`null` = not set) |
| `run-specific single values` | one row per run, e.g. the output name |
| `read1`, `read2` | the FASTQ files of each run, one row per run |
| `config`, `metadata` | used by workflUX, leave unchanged |

Only files on the server under `/data/data` can be used.

## Sheets

| Workflow | EM-seq | PBAT | Swift | WGBS | T-WGBS |
|---|---|---|---|---|---|
| `BAT_workflow` | [xlsx](BAT_workflow_EMSEQ.xlsx) | – | [xlsx](BAT_workflow_SWIFT.xlsx) | [xlsx](BAT_workflow_WGBS.xlsx) | [xlsx](BAT_workflow_TWGBS.xlsx) |
| `BAT_workflow_start_with_trimmed` | [xlsx](BAT_workflow_start_with_trimmed_EMSEQ.xlsx) | – | [xlsx](BAT_workflow_start_with_trimmed_SWIFT.xlsx) | [xlsx](BAT_workflow_start_with_trimmed_WGBS.xlsx) | [xlsx](BAT_workflow_start_with_trimmed_TWGBS.xlsx) |
| `biscuit_singlelib` | [xlsx](biscuit_singlelib_EMSEQ.xlsx) | [xlsx](biscuit_singlelib_PBAT.xlsx) | [xlsx](biscuit_singlelib_SWIFT.xlsx) | [xlsx](biscuit_singlelib_WGBS.xlsx) | – |
| `biscuit_singlelib_start_with_trimmed` | [xlsx](biscuit_singlelib_start_with_trimmed_EMSEQ.xlsx) | [xlsx](biscuit_singlelib_start_with_trimmed_PBAT.xlsx) | [xlsx](biscuit_singlelib_start_with_trimmed_SWIFT.xlsx) | [xlsx](biscuit_singlelib_start_with_trimmed_WGBS.xlsx) | – |
| `bsbolt_singlelib` | [xlsx](bsbolt_singlelib_EMSEQ.xlsx) | [xlsx](bsbolt_singlelib_PBAT.xlsx) | [xlsx](bsbolt_singlelib_SWIFT.xlsx) | [xlsx](bsbolt_singlelib_WGBS.xlsx) | – |
| `bsbolt_singlelib_start_with_trimmed` | [xlsx](bsbolt_singlelib_start_with_trimmed_EMSEQ.xlsx) | [xlsx](bsbolt_singlelib_start_with_trimmed_PBAT.xlsx) | [xlsx](bsbolt_singlelib_start_with_trimmed_SWIFT.xlsx) | [xlsx](bsbolt_singlelib_start_with_trimmed_WGBS.xlsx) | – |
| `bwameth_singlelib` | [xlsx](bwameth_singlelib_EMSEQ.xlsx) | [xlsx](bwameth_singlelib_PBAT.xlsx) | [xlsx](bwameth_singlelib_SWIFT.xlsx) | [xlsx](bwameth_singlelib_WGBS.xlsx) | – |
| `fame_multiple` | [xlsx](fame_multiple_EMSEQ.xlsx) | [xlsx](fame_multiple_PBAT.xlsx) | [xlsx](fame_multiple_SWIFT.xlsx) | [xlsx](fame_multiple_WGBS.xlsx) | [xlsx](fame_multiple_TWGBS.xlsx) |
| `gembs` | [xlsx](gembs_EMSEQ.xlsx) | – | [xlsx](gembs_SWIFT.xlsx) | [xlsx](gembs_WGBS.xlsx) | [xlsx](gembs_TWGBS.xlsx) |
| `gsnap_singlelib` | [xlsx](gsnap_singlelib_EMSEQ.xlsx) | [xlsx](gsnap_singlelib_PBAT.xlsx) | [xlsx](gsnap_singlelib_SWIFT.xlsx) | [xlsx](gsnap_singlelib_WGBS.xlsx) | – |
| `methylCtools_singlelib` | [xlsx](methylCtools_singlelib_EMSEQ.xlsx) | [xlsx](methylCtools_singlelib_PBAT.xlsx) | [xlsx](methylCtools_singlelib_SWIFT.xlsx) | [xlsx](methylCtools_singlelib_WGBS.xlsx) | – |
| `methylCtools_singlelib_start_with_trimmed` | [xlsx](methylCtools_singlelib_start_with_trimmed_EMSEQ.xlsx) | [xlsx](methylCtools_singlelib_start_with_trimmed_PBAT.xlsx) | [xlsx](methylCtools_singlelib_start_with_trimmed_SWIFT.xlsx) | [xlsx](methylCtools_singlelib_start_with_trimmed_WGBS.xlsx) | – |
| `methylpy_singlelib_start_with_trimmed` | [xlsx](methylpy_singlelib_start_with_trimmed_EMSEQ.xlsx) | [xlsx](methylpy_singlelib_start_with_trimmed_PBAT.xlsx) | [xlsx](methylpy_singlelib_start_with_trimmed_SWIFT.xlsx) | [xlsx](methylpy_singlelib_start_with_trimmed_WGBS.xlsx) | – |

The `*_start_with_trimmed` workflows skip adapter trimming and expect trimmed
reads. The repository has no job files for them, so their sheets use the
settings of the corresponding untrimmed workflow and the untrimmed test reads.
Replace the reads with trimmed FASTQ files for meaningful results.
