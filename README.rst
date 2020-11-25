ise-hardened-docker-example
======

This is an example repo of docker image hardening Jenkins Pipeline.


How to setup a new CICD Pipeline for new Docker Image
------

Step1, Prepare git repo to host jenkins scripts:

1. Duplicate this GitHub Repo, give it a name like ``ise-hardened-${your-docker-image-descriptor}``
2. Update ``Dockerfile``, put your source docker image at ``FROM``, update other metadata.

Step2, Setup Jenkins pipeline in Consol

1. Go to Jenkins Console -> ``New Item`` -> Choose ``Pipeline`` or ``Multibranch Pipeline`` project.
2. Configure Parameters:
    - Click This Project is parameterized
    - Add ``artifactoryURL``, ``artifactoryRegistry``, ... parameters. Basically these parameters are the arguments defined in our jenkins shared library - ``hardenDockerImage.groovy``. For full list of parameters, please check https://github.com/GSA/ise-jenkins-shared-library/blob/main/vars/hardenDockerImage.groovy 
3. Configure SCM:
    - Pipeline -> Pipeline script from SCM -> Git, fill in Git URL, credentials, branch. You can define a parameter ``gitBranch`` and use ``*/${gitBranch}`` in ``Branch Specifier input box`` -> set ``Script Path`` Jenkinsfile -> Uncheck Lightweight Checkout.

Step3, Import Jenkins Shared Library into Jenkins System

Jenkins -> Manage Jenkins -> Configure System -> Search: Global Pipeline Libraries

Fill in https://github.com/GSA/ise-jenkins-shared-library url, it will load the latest jenkins shared library into the runtime, so you can start using those libraries in ``Jenkinsfile``. Check "Load Implicitly" (if not check, you need to manually declare @Library("${LibraryName}") at begin of your Jenkinsfile).
