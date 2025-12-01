package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
@Table(name = "Colors")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ColorID", nullable = false)
    private Integer id;

    @Size(max = 10)
    @NotNull
    @Nationalized
    @Column(name = "ColorCode", nullable = false, length = 10)
    private String colorCode;

    @Size(max = 50)
    @NotNull
    @Nationalized
    @Column(name = "ColorName", nullable = false, length = 50)
    private String colorName;

    @Size(max = 7)
    @Nationalized
    @Column(name = "HexCode", length = 7)
    private String hexCode;

}