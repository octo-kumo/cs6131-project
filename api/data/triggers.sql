USE evilEr;
CREATE TRIGGER UpdateMessageCount
  AFTER INSERT
  ON evilEr.message
  FOR EACH ROW
  UPDATE user
  SET messages_sent = messages_sent + 1
  WHERE uid = NEW.uid;

CREATE TRIGGER UpdateObjectCount
  AFTER INSERT
  ON evilEr.object
  FOR EACH ROW
  UPDATE evilEr.diagram
  SET objects_made = objects_made + 1
  WHERE did = NEW.did;
