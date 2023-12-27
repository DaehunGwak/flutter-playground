import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = functions.runWith({memory: "512MB"})
    .region("asia-northeast3")
    .firestore
    .document("videos/{videoId}")
    .onCreate(async (snapshot, context) => {
        const spawn = require('child-process-promise').spawn;
        const video = snapshot.data();

        const filePath = `/tmp/${snapshot.id}.jpg`;

        await spawn("ffmpeg", [
            "-i",
            video.fileUrl,
            "-ss",
            "00:00:01.000",
            "-vframes",
            "1",
            "-vf",
            "scale=150:-1",
            filePath,
        ]);

        const storage = admin.storage();
        const [file, _] = await storage.bucket().upload(filePath, {
            destination: `thumbnails/${snapshot.id}.jpg`,
        });

        await file.makePublic();
        await snapshot.ref.update({
            thumbnailUrl: file.publicUrl(),
        });

        const db = admin.firestore();
        await db.collection("users")
            .doc(video.creatorUid)
            .collection("videos")
            .doc(snapshot.id)
            .set({
                thumbnailUrl: file.publicUrl(),
                videoId: snapshot.id,
            });
    });
