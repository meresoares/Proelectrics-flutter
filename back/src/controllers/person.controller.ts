//nececito que agregues los tres metodos faltantes, delete, update y buscar por id 

import { Request, Response } from 'express';
import { personService } from '../services/person.service';

class PersonController {
  async create(req: Request, res: Response) {
    try {
      const person = await personService.create(req.body);
      res.status(201).json(person);
    } catch (error) {
      if (error instanceof Error) {
        res.status(500).json({ message: error.message });
      } else {
        res.status(500).json({ message: 'An unexpected error occurred.' });
      }
    }
  }

  async getAll(req: Request, res: Response) {
    try {
      const persons = await personService.getAll();
      res.status(200).json(persons);
    } catch (error) {
      if (error instanceof Error) {
        res.status(500).json({ message: error.message });
      } else {
        res.status(500).json({ message: 'An unexpected error occurred.' });
      }
    }
  }

  async getById(req: Request, res: Response) {
    try {
      const person = await personService.getById(req.params.id);
      if (person) {
        res.status(200).json(person);
      } else {
        res.status(404).json({ message: 'Persona no encontrada.' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error al obtener la persona.' });
    }
  }

  async update(req: Request, res: Response) {
    try {
      const updatedPerson = await personService.update(req.params.id, req.body);
      if (updatedPerson) {
        res.status(200).json(updatedPerson);
      } else {
        res.status(404).json({ message: 'Persona no encontrada.' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error al actualizar la persona.' });
    }
  }

  async delete(req: Request, res: Response) {
    try {
      const result = await personService.delete(req.params.id);
      if (result) {
        res.status(200).json({ message: 'Persona eliminada exitosamente.' });
      } else {
        res.status(404).json({ message: 'Persona no encontrada.' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error al eliminar la persona.' });
    }
  }
}


export const personController = new PersonController();
