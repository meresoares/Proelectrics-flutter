import express from 'express';
import { customerController } from '../controllers/customer.controller';

const router = express.Router();

router.post('/create', customerController.create);
router.get('/getAll', customerController.getAll);
router.get('/:id', customerController.getById);
router.put('/update/:id', customerController.update);
router.delete('/delete/:id', customerController.delete);

export default router;
