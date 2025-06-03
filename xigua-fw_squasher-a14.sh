git clone https://github.com/linux-msm/pil-squasher --depth 1
cd pil-squasher
make install

rm -rf /firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/aston
mkdir -p $1/firmware-oneplus-a14/usr/lib/firmware/qca/
mkdir -p $1/firmware-oneplus-a14/usr/lib/firmware/ath12k/WCN7850/hw2.0/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/ath12k/WCN7850/hw2.0/* $1/firmware-oneplus-a14/usr/lib/firmware/ath12k/WCN7850/hw2.0/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/qca/* $1/firmware-oneplus-a14/usr/lib/firmware/qca/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/gmu_gen70200.bin $1/firmware-oneplus-a14/usr/lib/firmware/qcom/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/a740_sqe.fw $1/firmware-oneplus-a14/usr/lib/firmware/qcom/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xiguasnd-tplg.bin $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/regulatory.db* $1/firmware-oneplus-a14/usr/lib/firmware/
cp -rf $1/firmware-oneplus-a15/usr/lib/firmware/qcom/sm8550/xigua/modem* $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/

/usr/local/bin/pil-squasher $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/adsp.mbn $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/adsp.mdt
rm -rf $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/adsp.mdt $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/adsp.b*

cat $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b23_1 $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b23_2 > $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b23
cat $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b24_1 $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b24_2 > $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b24
/usr/local/bin/pil-squasher $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.mbn $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.mdt
rm -rf $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.mdt $1/firmware-oneplus-a14/usr/lib/firmware/qcom/sm8550/xigua/modem.b*

cd $1
dpkg-deb --build --root-owner-group firmware-oneplus-a14