## 使用代码获取当前 Apk 所使用的 Key 的 Sha1



```
public static String sHA1(Context context) {
    try {
        PackageInfo info = context.getPackageManager().getPackageInfo(
            context.getPackageName(), PackageManager.GET_SIGNATURES);
        byte[] cert = info.signatures[0].toByteArray();
        MessageDigest md = MessageDigest.getInstance("SHA1");
        byte[] publicKey = md.digest(cert);
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < publicKey.length; i++) {
            String appendString = Integer.toHexString(0xFF & publicKey[i])
                .toUpperCase(Locale.US);
            if (appendString.length() == 1)
                hexString.append("0");
                hexString.append(appendString);
                hexString.append(":");
        }
        String result ＝ hexString.toString();
        return result.substring(0, result.length()-1);
    } catch (NameNotFoundException e) {
        e.printStackTrace();
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    return null;
}


//
    public static String SHA1(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(
                    context.getPackageName(), PackageManager.GET_SIGNATURES);
            byte[] cert = info.signatures[0].toByteArray();
            MessageDigest md = MessageDigest.getInstance("SHA1");
            byte[] publicKey = md.digest(cert);
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < publicKey.length; i++) {
                String appendString = Integer.toHexString(0xFF & publicKey[i])
                        .toUpperCase(Locale.US);
                if (appendString.length() == 1)
                    hexString.append("0");
                hexString.append(appendString);
                hexString.append(":");
            }
            String result = hexString.toString();
            return result.substring(0, result.length()-1);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
```

