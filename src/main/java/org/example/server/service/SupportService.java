package org.example.server.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.server.models.Image;
import org.springframework.stereotype.Service;
import org.example.server.models.Support;
import org.example.server.repositories.SupportRepository;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class SupportService {
    private final SupportRepository supportRepository;

    public List<Support> listSupports (String title) {
        if(title != null) return supportRepository.findByTema(title);
        return supportRepository.findAll();
    }

    public void saveSupport(Support support, MultipartFile file1, MultipartFile file2, MultipartFile file3) {
        Image image1 = null;
        Image image2 = null;
        Image image3 = null;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            support.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            support.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            support.addImageToProduct(image3);
        }

        log.info("Saving new Support. Tema: {}; User: {}", support.getTema(), support.getUser());
        Support supportFromDb = supportRepository.save(support);

        if (!supportFromDb.getImages().isEmpty()) {
            supportFromDb.setPreviewImageId(supportFromDb.getImages().get(0).getId());
            supportRepository.save(support);
        }
    }


    private Image toImageEntity(MultipartFile file) {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        try {
            image.setBytes(file.getBytes());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return image;
    }

    public void deleteSupport(Long id) {
        log.info("Deleting Support with ID: {}", id);
        supportRepository.deleteById(id);
    }

    public Support getSupportById(Long id) {
        return supportRepository.findById(id).orElse(null);
    }
}