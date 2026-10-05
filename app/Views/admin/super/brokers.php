<?= $this->extend('admin/layouts/admin') ?>
<?= $this->section('content') ?>

<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
  <div>
    <h4 class="fw-900 mb-0">All Brokers</h4>
    <p class="text-muted small mb-0"><?= count($brokers) ?> broker<?= count($brokers)!==1?'s':'' ?> registered</p>
  </div>
  <div class="alert alert-info py-2 px-3 mb-0 rounded-pill" style="font-size:.82rem">
    <i class="bi bi-info-circle me-1"></i>Brokers are created by Sub-Admins in their city.
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
  <?php if(empty($brokers)): ?>
  <div class="text-center py-5">
    <i class="bi bi-people fs-1 text-muted d-block mb-2"></i>
    <h6 class="fw-700">No Brokers Yet</h6>
    <p class="text-muted small">No brokers yet. Sub-admins create brokers in their city.</p>
  </div>
  <?php else: ?>
  <div style="overflow-x:auto">
    <table class="admin-table">
      <thead><tr><th>Broker Name</th><th>Email</th><th>Phone</th><th>City</th><th>Sub-Admin</th><th>Hotels</th><th>Commission</th><th>Status</th><th>Actions</th></tr></thead>
      <tbody>
      <?php foreach($brokers as $b): ?>
      <tr>
        <td>
          <div class="d-flex align-items-center gap-2">
            <div style="width:34px;height:34px;border-radius:50%;background:linear-gradient(135deg,#10b981,#059669);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:.82rem;color:#fff">
              <?= strtoupper(substr($b['broker_name']??'?',0,1)) ?>
            </div>
            <span class="fw-700 small"><?= esc($b['broker_name']??'') ?></span>
          </div>
        </td>
        <td class="small"><?= esc($b['broker_email']??'') ?></td>
        <td class="small"><?= esc($b['broker_phone']??'-') ?></td>
        <td class="small"><?= esc($b['city']??'') ?></td>
        <td class="small"><?= esc($b['sub_admin_name']??'-') ?></td>
        <td><span class="badge bg-primary rounded-pill"><?= (int)($b['hotel_count']??0) ?></span></td>
        <td class="small fw-700"><?= $b['commission_pct']??0 ?>%</td>
        <td><span class="status-<?= esc($b['status']??'inactive') ?>"><?= ucfirst($b['status']??'inactive') ?></span></td>
        <td>
          <div class="d-flex gap-1">
            <a href="/admin/super/brokers/<?= (int)$b['admin_id'] ?>/edit" class="btn btn-sm btn-outline-primary rounded-pill fw-700" style="font-size:.75rem"><i class="bi bi-pencil me-1"></i>Edit</a>
            <form action="/admin/super/brokers/<?= (int)$b['admin_id'] ?>/delete" method="POST" class="d-inline" onsubmit="return confirm('Deactivate this broker?')">
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
