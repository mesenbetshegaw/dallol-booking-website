<?= $this->extend('admin/layouts/admin') ?>
<?= $this->section('content') ?>

<div class="d-flex align-items-center gap-3 mb-4">
  <a href="/admin/super/managers" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="bi bi-arrow-left me-1"></i>Back</a>
  <h4 class="fw-900 mb-0"><?= esc($pageTitle) ?></h4>
</div>

<div class="row justify-content-center">
  <div class="col-lg-7">
    <div class="admin-form-card">
      <form action="/admin/super/managers/<?= (int)$manager['id'] ?>/edit" method="POST">
        <?= csrf_field() ?>

        <div class="mb-3">
          <label class="form-label">Full Name <span class="text-danger">*</span></label>
          <input type="text" name="full_name" class="form-control" value="<?= esc($manager['full_name']??'') ?>" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" class="form-control" value="<?= esc($manager['email']??'') ?>" disabled>
          <div class="form-text">Email cannot be changed.</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Phone</label>
          <input type="text" name="phone" class="form-control" value="<?= esc($manager['phone']??'') ?>">
        </div>

        <div class="mb-3">
          <label class="form-label">Hotel (read-only)</label>
          <input type="text" class="form-control" value="<?= esc($manager['hotel_name']??'Not assigned') ?>" disabled>
          <div class="form-text">Hotel assignment is managed by the sub-admin.</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Status</label>
          <select name="status" class="form-select">
            <option value="active"    <?= ($manager['status']??'')==='active'   ?'selected':'' ?>>Active</option>
            <option value="suspended" <?= ($manager['status']??'')==='suspended'?'selected':'' ?>>Suspended</option>
            <option value="inactive"  <?= ($manager['status']??'')==='inactive' ?'selected':'' ?>>Inactive</option>
          </select>
        </div>

        <div class="mb-4">
          <label class="form-label">New Password <span class="text-muted small">(leave blank to keep current)</span></label>
          <input type="password" name="password" class="form-control" autocomplete="new-password">
        </div>

        <div class="d-flex gap-2">
          <button type="submit" class="btn btn-primary rounded-pill fw-700 px-4"><i class="bi bi-check-lg me-1"></i>Save Changes</button>
          <a href="/admin/super/managers" class="btn btn-outline-secondary rounded-pill px-4">Cancel</a>
        </div>
      </form>
    </div>
  </div>
</div>

<?= $this->endSection() ?>
