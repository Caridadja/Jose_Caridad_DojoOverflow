package com.caridadja.dojooverflow.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.caridadja.dojooverflow.models.Tag;

public interface TagRepository extends CrudRepository<Tag, Long> {
	List<Tag> findByName(String name);
}
