<?= $this->extend('admin/layouts/admin') ?>
<?= $this->section('content') ?>

<div class="d-flex justify-content-between align-items-center mb-4">
  <div>
    <h4 class="fw-900 mb-0">Hotel Managers</h4>
    <p class="text-muted small mb-0"><?= count($managers) ?> manager<?= count($managers)!==1?'s':'' ?> registered</p>
  </div>
</div>

<?php if(session()->getFlashdata('success')): ?>
<div class="alert alert-success alert-flash alert-dismissible fade show mb-3">
  <i class="bi bi-check-circle-fill me-2"></i><?= esc(session()->getFlashdata('success')) ?>
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>
<?php if(session()->getFlashdata('error')): ?>
<div class="alert alert-danger alert-flash alert-dismissible fade show mb-3">
  <i class="bi bi-exclamation-circle-fill me-2"></i><?= esc(session()->getFlashdata('error')) ?>
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<div class="admin-card p-0">
  <?php if(empty($managers)): ?>
  <div class="text-center py-5">
    <i class="bi bi-building-gear fs-1 text-muted d-block mb-2"></i>
    <h6 class="fw-700">No Hotel Managers Yet</h6>
    <p class="text-muted small">Hotel managers are assigned by sub-admins to hotels in their city.</p>
  </div>
  <?php else: ?>
  <div style="overflow-x:auto">
    <table class="admin-table">
      <thead><tr><th>Manager Name</th><th>Email</th><th>Phone</th><th>Hotel</th><th>City</th><th>Broker</th><th>Status</th><th>Actions</th></tr></thead>
      <tbody>
      <?php foreach($managers as $m): ?>
      <tr>
        <td>
          <div class="d-flex align-items-center gap-2">
            <div style="width:34px;height:34px;border-radius:50%;background:linear-gradient(135deg,#7c3aed,#a78bfa);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:.82rem;color:#fff">
              <?= strtoupper(substr($m['manager_name']??'?',0,1)) ?>
            </div>
            <span class="fw-700 small"><?= esc($m['manager_name']??'') ?></span>
          </div>
        </td>
        <td class="small"><?= esc($m['manager_email']??'') ?></td>
        <td class="small"><?= esc($m['manager_phone']??'-') ?></td>
        <td class="small fw-600"><?= esc($m['hotel_name']??'-') ?></td>
        <td class="small"><?= esc($m['hotel_city']??'-') ?></td>
        <td class="small"><?= esc($m['broker_name']??'Not assigned') ?></td>
        <td><span class="status-<?= esc($m['status']??'inactive') ?>"><?= ucfirst($m['status']??'inactive') ?></span></td>
        <td>
          <div class="d-flex gap-1">
            <a href="/admin/super/managers/<?= (int)$m['admin_id'] ?>/edit" class="btn btn-sm btn-outline-primary rounded-pill fw-700" style="font-size:.75rem"><i class="bi bi-pencil me-1"></i>Edit</a>
            <form action="/admin/super/managers/<?= (int)$m['admin_id'] ?>/delete" method="POST" class="d-inline" onsubmit="return confirm('Deactivate this manager?')">
              <?= csrf_field() ?>
              <button type="submit" class="btn btn-sm btn-outline-danger rounded-pill fw-700" style="font-size:.75rem"><i class="bi bi-slash-circle me-1"></i>Deactivate</button>
            </form>
          </div>
        </td>
      </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  </div>
  <?php endif; ?>
</div>

<?= $this->endSection() ?>
