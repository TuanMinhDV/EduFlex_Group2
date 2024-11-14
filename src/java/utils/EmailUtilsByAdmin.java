package utils;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtilsByAdmin {

    private static final String EMAIL_USERNAME = "NamlDHE173247@fpt.edu.vn"; // Địa chỉ email của bạn
    private static final String EMAIL_PASSWORD = "obuidhsinxmjovqy"; // Mật khẩu ứng dụng Gmail của bạn
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;

    /**
     * Phương thức gửi email đến một địa chỉ nhận nhất định với tiêu đề và nội dung cụ thể.
     * @param recipientEmail Địa chỉ email người nhận
     * @param subject Tiêu đề email
     * @param body Nội dung email
     */
    public static void sendEmail(String recipientEmail, String subject, String body) {
        // Cấu hình thuộc tính cho kết nối SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", String.valueOf(SMTP_PORT));

        // Tạo một phiên giao dịch với Gmail sử dụng xác thực mật khẩu
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
            }
        });

        try {
            // Tạo đối tượng tin nhắn email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(body);

            // Gửi tin nhắn
            Transport.send(message);
            System.out.println("Email sent successfully to " + recipientEmail);

        } catch (MessagingException e) {
            System.err.println("Failed to send the email to " + recipientEmail + ": " + e.getMessage());
            e.printStackTrace(); // In chi tiết lỗi để dễ dàng debug
        }
    }

    public static void main(String[] args) {
        // Gọi hàm gửi email để kiểm tra
        String testRecipient = "trangcuatui0@gmail.com"; // Thay bằng email thực để kiểm tra
        String testSubject = "Kiểm tra gửi email";
        String testBody = "Đây là email kiểm tra từ hệ thống Java.";
        
        sendEmail(testRecipient, testSubject, testBody);
    }
}
