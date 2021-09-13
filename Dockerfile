FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install --quiet --assume-yes python3-pip unzip wget

RUN pip install -U pip

COPY ./requirements.txt /tmp/requirements.txt

RUN  pip install -r /tmp/requirements.txt


RUN wget --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN dpkg --install google-chrome-stable_current_amd64.deb; apt-get --fix-broken --assume-yes install

RUN CHROMEDRIVER_VERSION='wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE' && \
    wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver && \
    chmod +x /opt/chromedriver/chromedriver && \
    ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver
    
ENTRYPOINT ['/run_tests.sh'] 
