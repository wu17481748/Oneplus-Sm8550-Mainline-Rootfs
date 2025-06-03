git clone https://github.com/linux-msm/pil-squasher --depth 1
cd pil-squasher
make install

rm -rf /firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/aston
/usr/local/bin/pil-squasher $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/adsp.mbn $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/adsp.mdt
rm -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/adsp.mdt $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/adsp.b*

#cat $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b23_1 $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b23_2 > $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b23
#cat $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b24_1 $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b24_2 > $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b24
/usr/local/bin/pil-squasher $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.mbn $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.mdt
rm -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.mdt $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem.b*

cd $1
dpkg-deb --build --root-owner-group firmware-oneplus-a15