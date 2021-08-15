FROM python:3.9

########################
# Get & compile nodejs # 
########################
ENV VERSION=v9.7.1
ENV DISTRO=linux-armv6l
RUN wget https://nodejs.org/dist/${VERSION}/node-${VERSION}-${DISTRO}.tar.xz \
		&& mkdir -p /usr/local/lib/nodejs \
		&& tar -xJvf node-${VERSION}-${DISTRO}.tar.xz -C /usr/local/lib/nodejs \
		&& rm node-${VERSION}-${DISTRO}.tar.xz
ENV PATH="/usr/local/lib/nodejs/node-${VERSION}-${DISTRO}/bin:${PATH}"

########################
# Generate js bundle   # 
########################
RUN npm install \
		&& npm run build 

########################
# Run Django app 
########################

# install python dependencies
RUN pip3 install --upgrade pip setuptools wheel 
RUN pip3 install --no-cache-dir -r requirements.txt

# The port this runs on
EXPOSE 9000

# Start django
CMD ["python3" ,"manage.py", "runserver", "0.0.0.0:9000"]
