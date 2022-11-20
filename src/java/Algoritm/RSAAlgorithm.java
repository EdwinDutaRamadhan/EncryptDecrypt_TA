/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Algoritm;

import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author HP
 */
public class RSAAlgorithm {

    String publicKeyString, privateKeyString;
    PrivateKey privateKey;
    PublicKey publicKey;

    public void test() throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        KeyPairGenerator keyPairGenerator
                = KeyPairGenerator.getInstance("RSA");
        SecureRandom secureRandom = new SecureRandom();

        keyPairGenerator.initialize(2048, secureRandom);

        KeyPair pair = keyPairGenerator.generateKeyPair();

        publicKey = pair.getPublic();

        publicKeyString
                = Base64.getEncoder().encodeToString(publicKey.getEncoded());

        System.out.println("public key = " + publicKeyString);

        privateKey = pair.getPrivate();

        privateKeyString
                = Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    public String keyGenerate(String visible) throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator
                = KeyPairGenerator.getInstance("RSA");
        SecureRandom secureRandom = new SecureRandom();

        keyPairGenerator.initialize(2048, secureRandom);

        KeyPair pair = keyPairGenerator.generateKeyPair();

        publicKey = pair.getPublic();

        publicKeyString
                = Base64.getEncoder().encodeToString(publicKey.getEncoded());

        System.out.println("public key = " + publicKeyString);

        privateKey = pair.getPrivate();

        privateKeyString
                = Base64.getEncoder().encodeToString(privateKey.getEncoded());

        System.out.println("private key = " + privateKeyString);
        switch (visible) {
            case "public":
                return publicKeyString;
            case "private":
                return privateKeyString;
            default:
                return "";
        }
    }

    public String cipher(String plainteks, String code) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        test();
        //Encrypt
        keyGenerate("private");
        Cipher encryptionCipher = Cipher.getInstance("RSA");
        encryptionCipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] encryptedMessage
                = encryptionCipher.doFinal(plainteks.getBytes());
        String encryption
                = Base64.getEncoder().encodeToString(encryptedMessage);
        System.out.println("encrypted message = " + encryption);

        //Decrypt
        Cipher decryptionCipher = Cipher.getInstance("RSA");
        decryptionCipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] decryptedMessage
                = decryptionCipher.doFinal(encryptedMessage);
        String decryption = new String(decryptedMessage);
        System.out.println("decrypted message = " + decryption);
        if (code.equals("encrypt")) {
            return encryption;
        } else if (code.equals("decrypt")) {
            return decryption;
        } else {
            return "";
        }
    }
}
