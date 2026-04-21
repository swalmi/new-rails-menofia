# db/seeds.rb
# This file is used to insert initial data into the database.

# ---------- Clean old data (development only) ----------
# Order matters because of foreign keys/associations:
# join table -> posts -> editors/users
PostEditor.destroy_all if defined?(PostEditor)
Post.destroy_all      if defined?(Post)
Editor.destroy_all    if defined?(Editor)
User.destroy_all      if defined?(User)

# ---------- Users ----------
users = User.create!([
  { name: "Alice", email: "alice@example.com" },
  { name: "Bob",   email: "bob@example.com"  }
])

# ---------- Editors ----------
editors = Editor.create!([
  { name: "Eve",  email: "eve@example.com" },
  { name: "Mark", email: "mark@example.com" }
])

# ---------- (Optional) Posts + join records ----------
# Helpful to test associations quickly.
posts = Post.create!([
  {
    title: "First Post",
    body: "Seeded post body",
    user: users[0],
    creator_id: users[1].id # set this only if you have creator_id column
  },
  {
    title: "Second Post",
    body: "Another seeded post",
    user: users[0],
    creator_id: users[0].id
  }
])

# Many-to-Many: connect posts and editors using join table
PostEditor.create!([
  { post: posts[0], editor: editors[0] },
  { post: posts[0], editor: editors[1] },
  { post: posts[1], editor: editors[1] }
])

puts "Seeded: #{User.count} users, #{Editor.count} editors, #{Post.count} posts, #{PostEditor.count} post_editors"