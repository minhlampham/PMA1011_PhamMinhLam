package org.example.templatejava6.Repository;

import org.example.templatejava6.Entity.CategoryHierarchy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryHierarchyRepository extends JpaRepository<CategoryHierarchy, Integer> {
}