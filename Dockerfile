# inherit prebuilt image
#Changed docker file
FROM prajwals3/projectfizilion:latest

# env setup
RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

# clone repo
RUN git clone https://github.com/PrajjuS/ProjectFizilion -b demon /Fizilion


#transfer
RUN curl -sL https://git.io/file-transfer | sh

# install required pypi modules
RUN pip3 install -r requirements.txt

#Adding a new user
ENV PATH="/usr/sbin:${PATH}"
RUN useradd docker
RUN usermod -aG wheel docker

USER docker


# Finalization
CMD ["python3","-m","userbot"]
