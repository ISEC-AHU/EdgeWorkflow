# EdgeWorkflow
An Edge Computing based Workflow Execution Engine for Smart Systems
# Developer
 * Developer organization:
 1. School of Computer Science and Technology, Anhui University, Hefei, China
 2. School of Information Technology, Deakin University, Geelong, Australia
 3. School of Software and Electrical Engineering, Swinburne University of Technology, Melbourne, Australia
 4. Faculty of Information Technology, Monash University, Melbourne, Australia

 * Developer member: Xuejun Li, Ran Ding, Xiao Liu, Jia Xu, Yun Yang and John Grundy.


## IMPORTANT
Please check the `improv` branch for latest changes. Master branch has been left intact until complete testing.

## How to run EdgeWorkflow ?

* Create a Java project in Eclipse.
* Inside the project directory, initialize an empty Git repository with the following command
* we provide a Web UI so that users can access EdgeWorkflow remotely and run their created edge workflow applications on our provided computing infrastructure. Web URL: http://47.98.222.243/EdgeWorkflow
```
git init
```
* Add the Git repository of EdgeWorkflow as the `origin` remote.
```
git remote add origin https://github.com/ISEC-AHU/EdgeWorkflow
```
* Pull the contents of the repository to your machine.
```
git pull origin master
```
* Run the example files (e.g. MainUI.java) to get started.

## The Details of the Offloading and Scheduling Algorithms

We introduce the details of the task offloading and scheduling algorithms supported in EdgeWorkflow currently. In the edge computing environment, given the three different layers of resources, viz. end device layer, Edge server layer and cloud server layer, a task offloading strategy is required first to determine which level or levels of resources will be used for task computation, before the task scheduling algorithm determines the order of tasks running on the allocated resources. (PDF link: https://github.com/ISEC-AHU/EdgeWorkflow/blob/649f920d984f1fe7fe659c63c418d573ceb1f1b3/The%20Details%20of%20the%20Offloading%20and%20Scheduling%20Algorithms.pdf).

# References
1.	X. Liu, L. Fan, J. Xu, X. Li, L. Gong, J. Grundy and Y. Yang, “FogWorkflowSim: an automated simulation toolkit for workflow performance evaluation in fog computing,” in Proceedings of the 34th IEEE/ACM International Conference on Automated Software Engineering (ASE). IEEE, 2019, pp. 1114-1117.
2.	X. Wang, Z. Ning and S. Guo, “Multi-agent imitation learning for pervasive edge computing: a decentralized computation offloading algorithm,” IEEE Transactions on Parallel and Distributed Systems, vol. 32, no. 2, pp. 411-425, 2020.
3.	X. Xu, Q. Huang, X. Yin, M. Abbasi, M. Khosravi and L. Qi, “Intelligent offloading for collaborative smart city services in edge computing,” IEEE Internet of Things Journal, vol. 7, no. 9, pp. 7919-7927, 2020.
4.	J. Xu, X. Li, X. Liu, C. Zhang, L. Fan, L. Gong and J. Li, “Mobility-aware workflow offloading and scheduling strategy for mobile edge computing,” in Proceedings of the International Conference on Algorithms and Architectures for Parallel Processing. Springer, pp. 184-199, 2019.
5.	I. Akkus, R. Chen, I. Rimac, M. Stein, K. Satzke, A. Beck, P. Aditya, et al., “SAND: towards high-performance serverless computing,” in Usenix Annual Technical Conference, 2018, pp. 923-935, 2018.
6.	“WorkflowGenerator,” https://confluence.pegasus.isi.edu/display/ pegasus/WorkflowGenerator, accessed on 1st November, 2020.
7.	H. Gupta, A. Dastjerdi, S. Ghosh and R. Buyya, “iFogSim: a toolkit for modeling and simulation of resource management techniques in the Internet of Things, Edge and Fog computing environments,” Software: Prac. and Exp., vol. 47, no. 9, pp. 1275-1296, 2017.
8.	R. Calheiros, R. Ranjan, A. Beloglazov, C. Rose and R. Buyya, “CloudSim: a toolkit for modeling and simulation of cloud computing environments and evaluation of resource provisioning algorithms,” Software: Prac. and Exp., vol. 41, no. 1, pp. 23-50, 2011.
9.	M. Malawski, A. Gajek, A. Zima, B. Balis and K. Figiela, “Serverless execution of scientific workflows: experiments with hyperflow, AWS Lambda and Google cloud functions,” Future Generation Computer Systems, vol. 110, pp. 502-514, 2020.
10.	J. Wang, M. AbdelBaky, J. Diaz-Montes, S. Purawat, M. Parashar, I. Altintas, “Kepler+ CometCloud: dynamic scientific workflow execution on federated cloud resources,” Procedia Computer Science, vol. 80, pp. 700-711, 2016.
