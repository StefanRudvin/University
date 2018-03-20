  _______ ______          __  __            _      _____  _    _          
 |__   __|  ____|   /\   |  \/  |     /\   | |    |  __ \| |  | |   /\    
    | |  | |__     /  \  | \  / |    /  \  | |    | |__) | |__| |  /  \   
    | |  |  __|   / /\ \ | |\/| |   / /\ \ | |    |  ___/|  __  | / /\ \  
    | |  | |____ / ____ \| |  | |  / ____ \| |____| |    | |  | |/ ____ \ 
    |_|  |______/_/    \_\_|  |_| /_/    \_\______|_|    |_|  |_/_/    \_\
                                                                          
                                                                          

Back-end and Front-end for our CS3028 Software Engineering Submission.

PLEASE NOTE, if you are having troubles deploying the project yourself,
the software has been placed on our own DigitalOcean server.
You can access it at: ==> http://notey.me/ <==

***Presented application serves as PROOF OF CONCEPT and is subject to HEAVY changes.***

If you'd like deploy the system yourself, you need to keep a couple of things in mind:

To deploy Back-End.
1. Make sure your enviornment is set up for work with Django and MySQL - create database "codemarker" if necessary.
2. Python requirements:
    *'rest_framework',
    *'corsheaders',
    *'docker'
3. Run "python3 manage.py runserver"
4. Confirm it is working by accessing http://localhost:8000

To deploy Front-End
1. Make sure your system is running npm at least version 5
2. Run "npm install" inside project root.
3. Run "npm start"
4. Confirm it is working by accessing http://localhost:80

Backend repository: https://github.com/StefanRudvin/CodeMarkerBack
Frontend repository: https://github.com/StefanRudvin/CodemarkerFront

Included sum2numps.py is an optimal solution which will pass Codemarker's marking procedure.

In case any issues please refer to the Technical Report or get in touch with the team leader (k.dryja.15@aberdeen.ac.uk).

Signed,
Team Alpha:
Konrad Dryja
Stefan Rudvin
Tautvydas Cerniauskas
Elzbieta Futkowska
Adrien Mainka

Computing Science Department, University of Aberdeen