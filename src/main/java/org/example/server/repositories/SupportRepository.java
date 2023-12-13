package org.example.server.repositories;

import org.example.server.models.Support;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SupportRepository extends JpaRepository<Support, Long> {
    List<Support> findByTema(String tema);
}