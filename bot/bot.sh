#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�mf  ���$P }���~�ߪ����PW��S:w@R����i�4�2z#�414i�i� ��4���� ��     4 	*d�h @@  2dшi����4ɈMi�0�@� � j2�'����z�Q��<��z�螑 ��Wt����T�������c/��(� ���Ł�<�bC�����UT�f ��Ư���2f�K��5�*f ]����%0+u��v�vT��m��m��
�8�0qu��ҝ��fC��gI_3<�9��J���+���9��(�}mlk0���0W��HdL����J�4SA$���".LE�AS6:���@��u���6�e��M�\�ʂ�$�v�9������7�B;�T�c��ƑX���
T1��L�Ի#�t{��E2;ϐ�A��?H��'Ɍ�&D�qHL�%�O�0TPD��**)&~����*�U��
r[lS�זw��349����a�āH�N�{.B]:�x�"�y�K���}B�-��\f2���A�"L���px3盐�I�m
*>��}�f��\Jꈤbp�JX�x�(1ˢ�����irR��"Ј�	nI~T���	 ��uE��h&�t��t�r�*:�`C5���~����y�0 Dý�2PyS�Ò���2c�l����
��[c�2!���i4��Ӿ�M�#�>A��*O-���A�(ނHvXވa���8���$Gva��ƣ��1i�vҳ� �[����+���iG�?:ю��0��`e���v���Y����F���K�bA��a�8ԫ�P��؉�\��5},�����an��H�i9B��`� %�(�x��
[��)�3��s��3�cB�2v��a��##K����m���(�޴I�e׉��hT#��Af��=yL��7�O#I ��r����p��$@&!C5��Q��T�@�.r���@V(S;�SY��0ɜ�R��=��AC�@��x��ӄ\�/�;/^��O�x��љ���D6ai�G�uq �����Dv���0��=�A<> T���pAW��m7������]��BB�E��