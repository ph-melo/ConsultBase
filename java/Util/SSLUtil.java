package Util;
import javax.net.ssl.*;
import java.security.*;
import java.security.cert.X509Certificate;

public class SSLUtil {
	
	public final static class SSLUtils {

	    private final static HostnameVerifier jvmHostnameVerifier = HttpsURLConnection.getDefaultHostnameVerifier();

	    private final static HostnameVerifier trivialHostnameVerifier = new HostnameVerifier() {
	        public boolean verify(String hostname, SSLSession sslSession) {
	            return true;
	        }
	    };

	    private final static TrustManager[] UNQUESTIONING_TRUST_MANAGER = new TrustManager[] { new X509TrustManager() {
	        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	            return null;
	        }

	        public void checkClientTrusted(X509Certificate[] certs, String authType) {
	        }

	        public void checkServerTrusted(X509Certificate[] certs, String authType) {
	        }
	    } };

	    public static void turnOffSslChecking() throws NoSuchAlgorithmException, KeyManagementException {
	        HttpsURLConnection.setDefaultHostnameVerifier(trivialHostnameVerifier);
	        // Install the all-trusting trust manager
	        SSLContext sc = SSLContext.getInstance("SSL");
	        sc.init(null, UNQUESTIONING_TRUST_MANAGER, null);
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	    }

	    public static void turnOnSslChecking() throws KeyManagementException, NoSuchAlgorithmException {
	        HttpsURLConnection.setDefaultHostnameVerifier(jvmHostnameVerifier);
	        // Return it to the initial state (discovered by reflection, now hardcoded)
	        SSLContext sc = SSLContext.getInstance("SSL");
	        sc.init(null, null, null);
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	    }

	    private SSLUtils() {
	        throw new UnsupportedOperationException("Do not instantiate libraries.");
	    }
	}

}
