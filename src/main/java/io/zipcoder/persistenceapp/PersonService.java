package io.zipcoder.persistenceapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Service
@RestController
public class PersonService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/people")
    public ResponseEntity<Person> addPerson(@RequestBody Person person){
        this.jdbcTemplate.execute("INSERT INTO person (FIRST_NAME, LAST_NAME, MOBILE, BIRTHDAY, HOME_ID)" +
                "values ('"+ person.getFirstName() + "', '"+ person.getLastName() +"', '"+ person.getMobile()+"' );");
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/people/{id}")
    public ResponseEntity<Person> updatePerson(@PathVariable Integer id){
        Person person = (Person) jdbcTemplate.queryForList("SELECT * FROM person WHERE ID = "+ id +";");
        if (person != null){
            this.jdbcTemplate.execute("UPDATE person (FIRST_NAME, LAST_NAME, MOBILE, BIRTHDAY, HOME_ID)" +
                    "values ('"+ person.getFirstName() + "', '"+ person.getLastName() +"', '"+ person.getMobile()+"' );");
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/people/{id}")
    public ResponseEntity deletePerson(@PathVariable Integer id){
        this.jdbcTemplate.execute("DELETE FROM person WHERE id = "+ id +";");
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/people/{id}")
    public ResponseEntity findById(Integer id){
        this.jdbcTemplate.execute("DELETE * FROM person WHERE id = "+ id +";");
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/people/firstname")
    public ResponseEntity peopleByFirstName(String firstName){
        this.jdbcTemplate.execute("SELECT * FROM person WHERE FIRST_NAME = '"+firstName+"';");
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/people/lastname")
    public ResponseEntity peopleByLastName(String lastName){
        this.jdbcTemplate.execute("SELECT * FROM person WHERE LAST_NAME = '"+lastName+"';");
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/people/birthday")
    public ResponseEntity peopleByBirthday(String birthDate){
        this.jdbcTemplate.execute("SELECT * FROM person WHERE BIRTHDAY = '"+birthDate+"';");
        return new ResponseEntity(HttpStatus.OK);
    }
}
