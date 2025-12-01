package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class CategoryHierarchy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "HierarchyID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ParentCategoryID")
    private Category parentCategoryID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ChildCategoryID")
    private Category childCategoryID;

}