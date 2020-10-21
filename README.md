#### Here is the repository of the script to process and fit imino 1H exchange experiments
#### Reference Rangadurai A., Shi H., Xu Y. et al (2020) 'delta-Melt: Nucleic acid conformational thermodynamics from melting experiments' BioRxiv

#### Here is the template NMR folder (with a ser file) of the imino proton exchange with all the processing Python Script
#### Dependency: Python 2.7.10, Pandas 0.17.1, Numpy 1.10.4, Scipy 0.17.0, Nmrglue 0.5, Matplotlib 2.2.2, NmrPipe 10.1

#### Procedure
##### 1. Type "bruker" and generate "fid.com"
##### 2. Modify "Process_ex_ir.py" and type "python Process_ex_ir.py" and generate pseudo ft2 file
##### 3. Modify "Simulation_ex_ir.py" and type "python Simulation_ex_ir.py" and generate the sim folder with all the simulation 1D peak
##### 4. Modify "Fit_ex_ir_3.py" and type "python Fit_ex_ir_3.py".

