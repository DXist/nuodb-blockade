Docker-based playground for NuoDB

Setup
-----

Install docker-compose ::

  $ pip install docker-compose>=1.2.0rc3


Disable transparent huge tables ::

  # echo never > /sys/kernel/mm/transparent_hugepage/enabled
  # echo never > /sys/kernel/mm/transparent_hugepage/defrag


Run docker-compose stack ::

  $ docker-compose up
