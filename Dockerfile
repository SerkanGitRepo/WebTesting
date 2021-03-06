FROM ubuntu:latest

ENV TZ=Europe/Kiev

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install --quiet --assume-yes python3-pip unzip wget

RUN pip install -U pip

COPY ./requirements.txt /tmp/requirements.txt

COPY ./GoogleSearch.robot /home/WebTesting/GoogleSearch.robot

COPY ./run_test.sh /home/WebTesting/run_test.sh

RUN chmod +x /home/WebTesting/run_test.sh

RUN  pip install -r /tmp/requirements.txt

COPY ./docker-compose.yml /home/docker-compose.yml

#RUN wget --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#RUN dpkg --install google-chrome-stable_current_amd64.deb; apt-get --fix-broken --assume-yes install

#RUN apt-get install -y libglib2.0-0 \ 
#    libnss3 \
#    libgconf-2-4 \
#    libfontconfig1

#RUN pip install pyvirtualdisplay

#ENV CHROMEDRIVER_VERSION 2.40

#ENV CHROMEDRIVER_DIR /chromedriver

#RUN mkdir $CHROMEDRIVER_DIR

#RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/94.0.4606.41/chromedriver_linux64.zip"

#RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

#ENV PATH $CHROMEDRIVER_DIR:$PATH

ENTRYPOINT ["/home/WebTesting/run_test.sh"] 
