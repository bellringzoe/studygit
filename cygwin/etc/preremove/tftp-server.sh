if [ -f /etc/xinetd.d/tftp ] && cmp -s /etc/defaults/etc/xinetd.d/tftp /etc/xinetd.d/tftp
then
    rm /etc/xinetd.d/tftp
fi

if [ -f /etc/inetd.d/tftp ] && cmp -s /etc/defaults/etc/inetd.d/tftp /etc/inetd.d/tftp
then
    rm /etc/inetd.d/tftp
fi

