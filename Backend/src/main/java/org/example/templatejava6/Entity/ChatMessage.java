package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "ChatMessages")
public class ChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MessageID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SessionID")
    private ChatSession sessionID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SenderID")
    private User senderID;

    @NotNull
    @Nationalized
    @Lob
    @Column(name = "MessageContent", nullable = false)
    private String messageContent;

    @ColumnDefault("0")
    @Column(name = "IsRead")
    private Boolean isRead;

    @ColumnDefault("getdate()")
    @Column(name = "SentAt")
    private Instant sentAt;

}