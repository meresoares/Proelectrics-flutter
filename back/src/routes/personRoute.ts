import express from 'express';
import { personController } from '../controllers/person.controller';

const router = express.Router();

router.post('/create', personController.create);
router.get('/getAll', personController.getAll);
router.get('/:id', personController.getById);
router.put('/update/:id', personController.update);
router.delete('/delete/:id', personController.delete);

export default router;
