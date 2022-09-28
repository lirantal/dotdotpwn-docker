FROM perl:latest

RUN curl -L http://cpanmin.us | perl - App::cpanminus

RUN cpanm Time::HiRes
RUN cpanm Socket
RUN cpanm IO::Socket
RUN cpanm IO::Socket::SSL
RUN cpanm Getopt::Std
RUN cpanm Net::FTP
RUN cpanm Bundle::LWP

# @TODO to find a better fix for it
# without forcing this perl module install the dotdotpwn
# program complains about the following error:
#   Can't locate object method "ssl_opts" via package "LWP::UserAgent" at DotDotPwn/HTTP_Url.pm line 49
# when run with the http-url module (`-m http-url ...`)
RUN perl -MCPAN -e "force install LWP::Protocol::https"

WORKDIR /dotdotpwn

RUN git clone https://github.com/wireghoul/dotdotpwn.git .

ENTRYPOINT ["perl", "dotdotpwn.pl"]
