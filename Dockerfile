FROM perl:latest

RUN curl -L http://cpanmin.us | perl - App::cpanminus

RUN cpanm Time::HiRes
RUN cpanm Socket
RUN cpanm IO::Socket
RUN cpanm IO::Socket::SSL
RUN cpanm Getopt::Std
RUN cpanm Net::FTP
RUN cpanm Bundle::LWP
RUN cpanm LWP::UserAgent

WORKDIR /dotdotpwn

RUN git clone https://github.com/wireghoul/dotdotpwn.git .

ENTRYPOINT ["perl", "dotdotpwn.pl"]
